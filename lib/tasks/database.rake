# frozen_string_literal: true

require 'rake'
require 'faker'

namespace :db do
  desc 'Fill database fake data'
  task faker: :environment do
    check_migration
    warning_message if Rails.env.production?
    fill_database_with_fake_data
  end

  private

  def check_migration
    # Checks for pending migrations and applies them before faker is run.
    ActiveRecord::Migration.check_pending!
  rescue ActiveRecord::PendingMigrationError => e
    puts e.to_s.strip
    exit 1
  end

  def warning_message
    puts 'You are going to fill the production database with fake data!'
    puts 'Are you sure you want to continue? y/N'
    input = STDIN.gets.chomp

    raise 'Aborted!' unless %w[y yes].include? input.downcase
  end

  def fill_database_with_fake_data
    fill_users
    fill_movies
    fill_seasons
    fill_purchase_options
    fill_purchases

    Faker::UniqueGenerator.clear
  end

  def fill_users
    7.times do
      User.create(email: Faker::Internet.unique.email)
    end
  end

  def fill_movies
    7.times do
      Movie.create(
        title: Faker::Book.unique.title,
        plot: Faker::Lorem.paragraph(2)
      )
    end
  end

  def fill_seasons
    5.times do
      season = Season.create(
        title: Faker::DcComics.unique.title,
        plot: Faker::Lorem.sentences(4).join(' ')
      )

      3.times do |i|
        Episode.create(
          title: Faker::Book.unique.title,
          plot: Faker::Movie.quote,
          number: i + 1,
          season: season
        )
      end
    end
  end

  def fill_purchase_options
    purchase_options = [
      { price: 3.45, quality: 'SD' },
      { price: 4.42, quality: 'SD' },
      { price: 13.3, quality: 'HD' },
      { price: 9.99, quality: 'HD' }
    ]

    purchase_options.each { |po| PurchaseOption.create(po) }
  end

  def fill_purchases
    User.last(3).each do |user|
      contents = Movie.last(2) + Season.last(2)

      contents.each do |content|
        from_date = Time.now - Random.rand(4).hours

        Purchase.create(
          from_date: from_date,
          user: user,
          content: content,
          purchase_option: PurchaseOption.all.sample
        )
      end
    end
  end
end
