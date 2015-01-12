class Api::Sessions::SessionsController < ApplicationController
	skip_before_filter :authenticate_user!
	respond_to :json