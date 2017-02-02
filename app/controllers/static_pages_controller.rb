class StaticPagesController < ApplicationController

  def home
    @recent_artists = Artist.reorder("created_at desc").limit(10)
    @recent_albums = Album.reorder("created_at desc").limit(10)
    @recent_lyrics = Lyric.reorder("created_at desc").limit(10)
    @popular_users = User.popular
  end

  def learn
  end

  def terms
  end

  def privacy
  end

  def dmca
  end

  def contact
  end

  def numbers
    @artists = Artist.all
  end

  def a
    @artists = Artist.all
  end

  def b
    @artists = Artist.all
  end

  def c
    @artists = Artist.all
  end

  def d
    @artists = Artist.all
  end

  def e
    @artists = Artist.all
  end

  def f
    @artists = Artist.all
  end

  def g
    @artists = Artist.all
  end

  def h
    @artists = Artist.all
  end

  def i
    @artists = Artist.all
  end

  def j
    @artists = Artist.all
  end

  def k
    @artists = Artist.all
  end

  def l
    @artists = Artist.all
  end

  def m
    @artists = Artist.all
  end

  def n
    @artists = Artist.all
  end

  def o
    @artists = Artist.all
  end

  def p
    @artists = Artist.all
  end

  def q
    @artists = Artist.all
  end

  def r
    @artists = Artist.all
  end

  def s
    @artists = Artist.all
  end

  def t
    @artists = Artist.all
  end

  def u
    @artists = Artist.all
  end

  def v
    @artists = Artist.all
  end

  def w
    @artists = Artist.all
  end

  def x
    @artists = Artist.all
  end

  def y
    @artists = Artist.all
  end

  def z
    @artists = Artist.all
  end

end
