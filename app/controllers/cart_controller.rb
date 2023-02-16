class CartController < ApplicationController
  include ActionView::Helpers::TextHelper

  def update 
    song = Song.find(params[:song_id])
    song_id_str = song.id.to_s
    cart.add_song(song_id_str)
    session[:cart] = cart.session_cart_contents
    quantity = cart.count_of(song_id_str)

    flash[:notice] = "You now have #{pluralize(quantity, "copy")} of #{song.title} in your cart"
    redirect_to songs_path
  end
end