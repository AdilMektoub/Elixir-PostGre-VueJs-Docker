defmodule Theme01Web.Router do
  use Theme01Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Theme01Web do
    pipe_through :api

    scope "/users" do
      post "/", UserController, :create
      get "/", UserController, :show_by_attr
      get "/all", UserController, :index
      get "/:userID", UserController, :show
      put "/:userID", UserController, :update
      delete "/:userID", UserController, :delete
    end

    scope "/workingtimes" do
      get "/all", WorkingTimeController, :index
      get "/:userID", WorkingTimeController, :show_by_attr
      get "/:userID/:workingtimeID", WorkingTimeController, :show
      post "/:userID", WorkingTimeController, :createUserID
      put "/:id", WorkingTimeController, :update
      delete "/:id", WorkingTimeController, :delete
    end

    scope "/clocks" do
      get "/all", ClockController, :index
      get "/:userID", ClockController, :show
      post "/:userID", ClockController, :handle_clock
    end
  end
end
