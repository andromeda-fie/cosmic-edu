defmodule CosmicEduWeb.LandingPageController do
  use CosmicEduWeb, :controller

  def show(conn, _), do: render(conn, "show.html")
end
