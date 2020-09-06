class Student
  attr_accessor :name, :grade
  attr_reader :id
  def initialize(name, grade, id=nil)
    @name = name
    @grade = grade
    @id = id
    # binding.pry
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
    # @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
  end
 def self.drop_table
   sql = <<-TEMP
   DROP TABLE IF EXISTS students;
   TEMP
   DB[:conn].execute(sql)
 end
 def save
   sql=<<-TEMP
   INSERT INTO students (name, grade) VALUES (?, ?);
   TEMP
   DB[:conn].execute(sql, self.name, self.grade)
 end
end
