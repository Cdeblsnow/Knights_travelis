class Vertex
  attr_accessor :coordinate
  
  def initialize(coordinate) #first coordinate is [0,0]
    @coordinate = coordinate 
    @top = nil 
    @bottom = nil 
    @right = nil 
    @left = nil
  end

  def append(coordinate)
    new_vertex = Vertex.new(coordinate)
    if @coordinate[0] < new_vertex.coordinate[0] # compare x coordinate
      @right = new_vertex
    elsif @coordinate[0] > new_vertex.coordinate[0]
      @left = new_vertex
    elsif @coordinate[1] <  new_vertex.coordinate[0] #compare y coordinate
      @bottom = new_vertex
    else 
      @top = new_vertex
    end

  end
end