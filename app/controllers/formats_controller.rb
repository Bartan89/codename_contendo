class FormatsController < ApplicationController

  def index
    @icons = Icon.all
    @formats = "something"
    @formats = policy_scope(Format)
  end
end
