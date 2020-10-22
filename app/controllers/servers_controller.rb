class ServersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user_server, only: [:edit, :update, :destroy]
  before_action :set_server, only: []

  def index
    @servers = Server.where(:user_id => current_user.id)
  end

  def create
    @server = current_user.servers.build(server_params)

    if @server.save
      redirect_to controller: 'servers', action: 'index'
      flash.notice = 'Адрес сервера добавлен'
    else
      redirect_to controller: 'servers', action: 'index'
      flash.notice = 'Возникла ошибка при сохранении'
    end
  end

  private

  def set_current_user_event
    @server = current_user.servers.find(params[:id])
  end

  def set_server
    @server = Server.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def server_params
    params.require(:server).permit(:url)
  end
end
