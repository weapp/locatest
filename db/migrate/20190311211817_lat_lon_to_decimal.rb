class LatLonToDecimal < ActiveRecord::Migration[5.2]
  def up
    # https://stackoverflow.com/questions/15965166/what-is-the-maximum-length-of-latitude-and-longitude
    # limits by EPSG:900913 / EPSG:3785 / OSGEO:41001 are the following:
    # Valid longitudes are from -180 to 180 degrees.
    # Valid latitudes are from -85.05112878 to 85.05112878 degrees.

    remove_column :venues, :lat
    remove_column :venues, :lon
    add_column :venues, :lat, :decimal, :precision => 12, :scale => 10
    add_column :venues, :lon, :decimal, :precision => 13, :scale => 10
  end

  def down
    remove_column :venues, :lat
    remove_column :venues, :lon
    add_column :venues, :lat, :string
    add_column :venues, :lon, :string
  end
end
