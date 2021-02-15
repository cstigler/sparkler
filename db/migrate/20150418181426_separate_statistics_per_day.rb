class SeparateStatisticsPerDay < ActiveRecord::Migration[4.2]
  def up
    add_column :statistics, :date, :date, null: false, after: 'feed_id'

    Statistic.update_all "date = to_date(CONCAT(year, '-', month, '-1'), '%Y-%m-%d')"

    remove_index "statistics", name: 'stats_index'
    add_index "statistics", ["feed_id", "date", "property_id", "option_id"], name: 'stats_index', unique: true

    remove_column :statistics, :year
    remove_column :statistics, :month
  end

  def down
    add_column :statistics, :year, :integer, null: false, after: 'feed_id'
    add_column :statistics, :month, :integer, null: false, after: 'year'

    Statistic.update_all "year = EXTRACT(YEAR from date), month = EXTRACT(MONTH from date)"

    remove_index "statistics", name: 'stats_index'
    add_index "statistics", ["feed_id", "year", "month", "property_id", "option_id"], name: 'stats_index', unique: true

    remove_column :statistics, :date
  end
end
