class Image
  #accessor enables read and write, storing variable
  attr_accessor :array
    
  #intialize runs 
  def initialize (array)
    @array = array
  end
    
  # method output_image shows what's in array on screen
  def output_image
  # loop continues through each Row and outputs content
  puts "Original Image"
    @array.each do |row|
      puts row.join
    end
  end


  def blur(distance)
    coordinates = []
    d = distance
    counter = 1
    counter_b = 1

    @array.each_with_index do |row, row_index|
      row.each_with_index do |value, value_index|
        if value == 1
          coordinates << [row_index, value_index]
        end
      end
    end       

    coordinates.each do |coordinate|
      row_coordinate = coordinate[0]
      value_coordinate = coordinate[1]
        until counter > d
          until counter_b > d
          @array[row_coordinate + counter ][value_coordinate + (d - counter_b)] = 1 if @array[row_coordinate + counter ]
          @array[row_coordinate - counter ][value_coordinate + (d - counter_b)] = 1 if @array[row_coordinate - counter ][value_coordinate + (d - counter_b)]
          @array[row_coordinate + counter ][value_coordinate - (d - counter_b)] = 1 if @array[row_coordinate + counter ]
          @array[row_coordinate - counter ][value_coordinate - (d - counter_b)] = 1 if @array[row_coordinate - counter ][value_coordinate - (d - counter_b)]
          counter_b = counter_b + 1
          end
        @array[row_coordinate][value_coordinate + counter] = 1 if @array[row_coordinate][value_coordinate + counter]
        @array[row_coordinate][value_coordinate - counter] = 1                  
        counter = counter + 1
        counter_b = 1
        end
        counter = 1 
    end
        puts "Blurred Image"
         @array.each do |row|
        puts row.join
        end
  end
end

 image = Image.new([
   [0, 0, 0, 0, 0, 0, 0, 0, 0],
   [0, 0, 0, 0, 0, 0, 0, 0, 0],
   [0, 0, 1, 0, 0, 0, 0, 0, 0],
   [0, 0, 0, 0, 0, 0, 0, 0, 0],
   [0, 0, 0, 0, 0, 0, 0, 0, 0],
   [0, 0, 0, 0, 0, 0, 0, 0, 0],
   [0, 0, 0, 0, 0, 0, 0, 0, 0],
   [0, 0, 0, 0, 0, 0, 0, 0, 0],
   [0, 0, 0, 0, 0, 0, 0, 0, 0],
   [0, 0, 0, 0, 0, 0, 0, 0, 0],
   [0, 0, 0, 0, 0, 0, 1, 0, 0],
   [0, 0, 0, 0, 0, 0, 0, 0, 0]
   ])

image.output_image
image.blur(2)
