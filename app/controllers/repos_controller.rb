class ReposController < ApplicationController

  def index
    repos = Repo.where(user_id: current_user.id)
    render json: repos.to_json
  end

  def show
    repo = Repo.find(params[:id])
    render json: repo.to_json
  end

  def create
    repo = Repo.create(repo_params)
    render json: repo.to_json
  end

  def update
    repo = Repo.find(params[:id])
    repo.update(repo_params)
    render json: repo.to_json
  end

  private

  def repo_params
    params.require(:repo).permit(:name, :url)
  end

end
