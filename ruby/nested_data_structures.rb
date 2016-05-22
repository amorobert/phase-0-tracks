middle_school = {
  principle: "Mrs. Perry",
  eight_grade: {
    math_science_teacher: "Mrs. Williams",
    social_studies_english_teacher: "Mr. Hudson",
    students: ["Mandy", "Bobby", "Latoya", "Fransico"]
  },
  seventh_grade: {
    math_science_teacher: "Mr. Robinson",
    social_studies_english_teacher: "Ms. Washington",
    students: ["Danny", "Maysa", "Narita", "David"]
  },
  physical_education_instructor: "Mr. Hussain",
  band_director: "Ms. Beverly"
}

p middle_school[:seventh_grade][:students][2]
p middle_school[:eight_grade][:math_science_teacher]
