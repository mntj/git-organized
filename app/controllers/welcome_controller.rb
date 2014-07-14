class WelcomeController < ApplicationController

  def index
    if current_user
      current_user.update_github_repos
    end
  end

end
