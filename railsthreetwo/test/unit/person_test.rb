require 'test_helper'

class PersonTest < ActiveSupport::TestCase

  context "existing person without games" do
    setup do
      Person.destroy_all
      Game.destroy_all
      @existing_person_without_games = Person.create(name: 'no gamer')
    end

    context "counting via 'count'" do
      should "associate addition to in-memory game collection using 'new'" do
        game = @existing_person_without_games.games.new(name: 'ms. pacman')
        assert_equal 1, @existing_person_without_games.games.count, "expected fail on 3.0, 3.1, 3.2"
      end

      should "associate addition to in-memory game collection using 'build'" do
        game = @existing_person_without_games.games.build(name: 'ms. pacman')
        assert_equal 1, @existing_person_without_games.games.count, "expected fail on 3.0, 3.1, 3.2"
      end

      should "associate addition to saved game collection using 'new'" do
        game = @existing_person_without_games.games.new(name: 'ms. pacman')
        @existing_person_without_games.save
        @existing_person_without_games.reload
        # the following will fail on rails 3.0 with count of 0, but pass on 3.1 and 3.2
        assert_equal 1, @existing_person_without_games.games.count, "expected fail on 3.0"
      end

      should "associate addition to saved game collection using 'build'" do
        game = @existing_person_without_games.games.build(name: 'ms. pacman')
        @existing_person_without_games.save
        @existing_person_without_games.reload
        assert_equal 1, @existing_person_without_games.games.count
      end
    end

    context "counting via 'length'" do
      should "associate addition to in-memory game collection using 'new'" do
        game = @existing_person_without_games.games.new(name: 'ms. pacman')
        assert_equal 1, @existing_person_without_games.games.length, "expected fail on 3.0, 3.1, 3.2"
      end

      should "associate addition to in-memory game collection using 'build'" do
        game = @existing_person_without_games.games.build(name: 'ms. pacman')
        assert_equal 1, @existing_person_without_games.games.length, "expected fail on 3.0, 3.1, 3.2"
      end

      should "associate addition to saved game collection using 'new'" do
        game = @existing_person_without_games.games.new(name: 'ms. pacman')
        @existing_person_without_games.save
        @existing_person_without_games.reload
        # the following will fail on rails 3.0 with count of 0, but pass on 3.1 and 3.2
        assert_equal 1, @existing_person_without_games.games.length, "expected fail on 3.0"
      end

      should "associate addition to saved game collection using 'build'" do
        game = @existing_person_without_games.games.build(name: 'ms. pacman')
        @existing_person_without_games.save
        @existing_person_without_games.reload
        assert_equal 1, @existing_person_without_games.games.length
      end
    end
  end

  context "existing person with existing games" do

    setup do
      Person.destroy_all
      Game.destroy_all
      @existing_person_with_games = Person.create(name: 'steam gamer')
      @existing_person_with_games.games << Game.create(name: 'Donkey Kong')
      @existing_person_with_games.games << Game.create(name: 'Pacman')
    end

    context "counting via 'count'" do

      should "already have members in the collection" do
        assert_equal 2, @existing_person_with_games.games.count
      end

      should "associate addition to saved game collection using 'new'" do
        game = @existing_person_with_games.games.new(name: 'ms. pacman')
        @existing_person_with_games.save
        @existing_person_with_games.reload
        # the following will fail on rails 3.0 with count of 2, but pass on 3.1 and 3.2
        assert_equal 3, @existing_person_with_games.games.count, "expected fail on 3.0"
      end

      should "associate addition to saved game collection using 'build'" do
        game = @existing_person_with_games.games.build(name: 'ms. pacman')
        @existing_person_with_games.save
        @existing_person_with_games.reload
        # the following will fail on rails 3.0 with count of 2, but pass on 3.1 and 3.2
        assert_equal 3, @existing_person_with_games.games.count, "expected fail on 3.0"
      end

    end

    context "counting via 'length'" do
      should "already have members in the collection" do
        assert_equal 2, @existing_person_with_games.games.length
      end

      should "associate addition to saved game collection using 'new'" do
        game = @existing_person_with_games.games.new(name: 'ms. pacman')
        @existing_person_with_games.save
        @existing_person_with_games.reload
        # the following will fail on rails 3.0 with count of 2, but pass on 3.1 and 3.2
        assert_equal 3, @existing_person_with_games.games.length
      end

      should "associate addition to saved game collection using 'build'" do
        game = @existing_person_with_games.games.build(name: 'ms. pacman')
        @existing_person_with_games.save
        @existing_person_with_games.reload
        # the following will fail on rails 3.0 with count of 2, but pass on 3.1 and 3.2
        assert_equal 3, @existing_person_with_games.games.length
      end

      should "associate addition to in-memory game collection using 'new'" do
        game = @existing_person_with_games.games.new(name: 'ms. pacman')
        # the following will fail on rails 3.0 with count of 2, but pass on 3.1 and 3.2
        assert_equal 3, @existing_person_with_games.games.length
      end

      should "associate addition to in-memory game collection using 'build'" do
        game = @existing_person_with_games.games.build(name: 'ms. pacman')
        # the following will fail on rails 3.0 with count of 2, but pass on 3.1 and 3.2
        assert_equal 3, @existing_person_with_games.games.length
      end
    end
  end

  context "existing person with new games" do

    setup do
      Person.destroy_all
      Game.destroy_all
      @existing_person_with_games = Person.create(name: 'steam gamer')
      @existing_person_with_games.games << Game.new(name: 'Donkey Kong')
      @existing_person_with_games.games << Game.new(name: 'Pacman')
    end

    context "counting via 'count'" do

      should "already have members in the collection" do
        assert_equal 2, @existing_person_with_games.games.count
      end

      should "associate addition to saved game collection using 'new'" do
        game = @existing_person_with_games.games.new(name: 'ms. pacman')
        @existing_person_with_games.save
        @existing_person_with_games.reload
        # the following will fail on rails 3.0 with count of 2, but pass on 3.1 and 3.2
        assert_equal 3, @existing_person_with_games.games.count, "expected fail on 3.0"
      end

      should "associate addition to saved game collection using 'build'" do
        game = @existing_person_with_games.games.build(name: 'ms. pacman')
        @existing_person_with_games.save
        @existing_person_with_games.reload
        # the following will fail on rails 3.0 with count of 2, but pass on 3.1 and 3.2
        assert_equal 3, @existing_person_with_games.games.count, "expected fail on 3.0"
      end

    end

    context "counting via 'length'" do
      should "already have members in the collection" do
        assert_equal 2, @existing_person_with_games.games.length
      end

      should "associate addition to saved game collection using 'new'" do
        game = @existing_person_with_games.games.new(name: 'ms. pacman')
        @existing_person_with_games.save
        @existing_person_with_games.reload
        assert_equal 3, @existing_person_with_games.games.length
      end

      should "associate addition to saved game collection using 'build'" do
        game = @existing_person_with_games.games.build(name: 'ms. pacman')
        @existing_person_with_games.save
        @existing_person_with_games.reload
        assert_equal 3, @existing_person_with_games.games.length
      end

      should "associate addition to in-memory game collection using 'new'" do
        game = @existing_person_with_games.games.new(name: 'ms. pacman')
        assert_equal 3, @existing_person_with_games.games.length
      end

      should "associate addition to in-memory game collection using 'build'" do
        game = @existing_person_with_games.games.build(name: 'ms. pacman')
        assert_equal 3, @existing_person_with_games.games.length
      end
    end
  end

  context "new person without games" do

    setup do
      Person.destroy_all
      Game.destroy_all
      @person = Person.new(name: 'n00b')
    end

    context "counting via 'length'" do

      should "associate addition to in-memory game collection using 'new'" do
        game = @person.games.new(name: 'ms. pacman')
        assert_equal 1, @person.games.length, "expected fail on 3.0"
      end

      should "associate addition to in-memory game collection using 'build'" do
        game = @person.games.build(name: 'ms. pacman')
        assert_equal 1, @person.games.length # OK, why does THIS not fail?
      end

    end

    context "counting via 'count'" do

      should "associate addition to in-memory game collection using 'new'" do
        game = @person.games.new(name: 'ms. pacman')
        assert_equal 1, @person.games.count, "expected fail on 3.0, 3.1, 3.2"
      end

      should "associate addition to in-memory game collection using 'build'" do
        game = @person.games.build(name: 'ms. pacman')
        assert_equal 1, @person.games.count, "expected fail on 3.0, 3.1, 3.2"
      end

    end

  end

end
