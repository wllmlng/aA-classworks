# == Schema Information
#
# Table name: actors
#
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: movies
#
#  id          :integer      not null, primary key
#  title       :string
#  yr          :integer
#  score       :float
#  votes       :integer
#  director_id :integer
#
# Table name: castings
#
#  movie_id    :integer      not null, primary key
#  actor_id    :integer      not null, primary key
#  ord         :integer

require_relative './sqlzoo.rb'

def example_join
  execute(<<-SQL)
    SELECT
      *
    FROM
      movies
    JOIN
      castings ON movies.id = castings.movie_id
    JOIN
      actors ON castings.actor_id = actors.id
    WHERE
      actors.name = 'Sean Connery'
  SQL
end

def ford_films
  # List the films in which 'Harrison Ford' has appeared.
  execute(<<-SQL)
    SELECT
      title
    FROM
      movies
    JOIN
      castings ON movies.id = castings.movie_id
    JOIN
      actors ON castings.actor_id = actors.id
    WHERE
      actors.name = 'Harrison Ford'
  SQL
 
end
  # SELECT
  #   title
  # FROM
  #   movies 
  # WHERE
  #   id IN (
  #       SELECT
  #         movie_id
  #       FROM
  #         castings
  #       WHERE
  #         actor_id = (
  #                   SELECT
  #                     actors.id
  #                   FROM 
  #                     actors
  #                   WHERE
  #                     name = 'Harrison Ford'
  #         )
  #   )       

def ford_supporting_films
  # List the films where 'Harrison Ford' has appeared - but not in the star
  # role. [Note: the ord field of casting gives the position of the actor. If
  # ord=1 then this actor is in the starring role]
  execute(<<-SQL)
  SQL
end

def films_and_stars_from_sixty_two
  # List the title and leading star of every 1962 film.
  execute(<<-SQL)
  SQL
end

def travoltas_busiest_years
  # Which were the busiest years for 'John Travolta'? Show the year and the
  # number of movies he made for any year in which he made at least 2 movies.
  execute(<<-SQL)
  SQL
end

def andrews_films_and_leads
  # List the film title and the leading actor for all of the films 'Julie
  # Andrews' played in.
  execute(<<-SQL)
    SELECT
      julie_movies.title, lead_actors.name
    FROM
      movies AS julie_movies
    JOIN
      castings AS julie_castings ON julie_castings.movie_id = julie_movies.id
    JOIN
      actors AS julie_actors ON julie_actors.id = julie_castings.actor_id
    JOIN
      castings AS lead_castings ON lead_castings.movie_id = julie_movies.id
    JOIN
      actors AS lead_actors ON lead_actors.id = lead_casting.actor_id
    WHERE
      julie_actors.name = 'Julie Andrews'
        AND
      lead_castings.ord = 1
    


  SQL
end

    # SELECT
    #   movies.title, actor.name
    # FROM
    #   movies
    # JOIN
    #   castings ON castings.movies_id = movies.id
    # JOIN
    #   actors ON actors.id = castings.actor_id
    # WHERE
    #   castings.ord = 1
    #     AND
    #   movies.title IN (
    #     SELECT
    #       movies.title
    #     FROM
    #       movies
    #     JOIN
    #       castings ON castings.movie_id = movies.id
    #     JOIN
    #       actors ON actors.id = castings.actor_id
    #     WHERE
    #       actors.name = 'Julie Andrews'
    #   )

def prolific_actors
  # Obtain a list in alphabetical order of actors who've had at least 15
  # starring roles.
  execute(<<-SQL)
  SQL
end

def films_by_cast_size
  # List the films released in the year 1978 ordered by the number of actors
  # in the cast (descending), then by title (ascending).
  execute(<<-SQL)
  SQL
end

def colleagues_of_garfunkel
  # List all the people who have played alongside 'Art Garfunkel'.
  execute(<<-SQL)
  SQL
end