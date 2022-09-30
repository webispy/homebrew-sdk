# frozen_string_literal: true

class GitHubPrivateRepositorySnapshotDownloadStrategy < CurlDownloadStrategy
  require "utils/formatter"
  require "utils/github"

  def initialize(url, name, version, **meta)
    super
    parse_url_pattern
    set_github_token
  end

  def parse_url_pattern
    unless (match = url.match(%r{https://github.com/([^/]+)/#([^/]+)/archive/(\S+).tar.gz}))
      raise CurlDownloadStrategyError, "Invalid archive url pattern for GitHub Repository."
    end

    _, @owner, @repo, @filepath = *match
  end

  def set_github_token
    @github_token = ENV.fetch("HOMEBREW_GITHUB_API_TOKEN")
    unless @github_token
      raise CurlDownloadStrategyError, "Environmental variable HOMEBREW_GITHUB_API_TOKEN is required."
    end

    validate_github_repository_access!
  end

  def validate_github_repository_access!
    # Test access to the repository
    GitHub.repository(@owner, @repo)
  rescue GitHub::HTTPNotFoundError
    # We only handle HTTPNotFoundError here,
    # becase AuthenticationFailedError is handled within util/github.
    message = <<~MESSAGE
      HOMEBREW_GITHUB_API_TOKEN can not access the repository: #{@owner}/#{@repo}
      This token may not have permission to access the repository or the url of formula may be incorrect.
    MESSAGE
    raise CurlDownloadStrategyError, message
  end

  def download_url
    "https://api.github.com/repos/#{@owner}/#{@repo}/tarball/#{@filepath}"
  end

  private

  def _fetch(*)
    # HTTP request header `Accept: application/octet-stream` is required.
    # Without this, the GitHub API will respond with metadata, not binary.
    curl_download download_url,
                  "--header", "Authorization: Bearer #{@github_token}",
                  "--header", "Accept: application/vnd.github+json",
                  to: temporary_path
  end
end
