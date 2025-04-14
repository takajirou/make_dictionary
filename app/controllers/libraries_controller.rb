class LibrariesController < ApplicationController
  before_action :authenticate_user!

  def index
    @libraries = Library.where(user_id: current_user.id)
  end

  def new
    @libraries = Library.new
  end

  def edit
    @libraries = Library.find(params[:id])
  end

  def create
    ActiveRecord::Base.transaction do
      @libraries = Libraries.new(library_params)

      if @libraries.save
        LibraryMember.create(library_id: @library.id, user_id: current_user.id, role: "admin")
        redirect_to @library, notice: "Library was successfully created."
      else
        render :new
      end
    end

  rescue ActiveRecord::RecordInvalid => e
    # トランザクションでエラーが発生した場合のエラーハンドリング
    flash.now[:alert] = "Something went wrong: #{e.message}"
    render :new
  end

  private

  def library_params
    params.require(:library).permit(:name, :description, :owner_id)
  end
end
