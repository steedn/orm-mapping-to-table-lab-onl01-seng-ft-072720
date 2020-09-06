class Student
  attr_accessor :name, :grade, :id
  def initialize(name, grade, id = nil)
    @name = name
    @grade = grade
    @id = id
    binding.pry
  end
  def self.create_table
    sql = <<-TEMP
    CREATE TABLE IF NOT EXISTS students(
    id INTEGER PRIMARY KEY,
    name TEXT,
    grade INTEGER
    );
    TEMP
    DB[:conn].execute(sql)
  end
end
