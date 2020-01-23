User.destroy_all
Question.destroy_all
Answer.destroy_all



u1=User.create(name: "Sam")
u2=User.create(name: "Arthur")
u3=User.create(name: "Anna")



q1=Question.create(title: "When will my baby start walking?")
q2=Question.create(title: "When will my child start talking?")
q3=Question.create(title: "When can my child start eating solid foods?")
q4=Question.create(title: "When will my child start babling?")
q5=Question.create(title: "How long do I wait after I introduced my child to their first food to give it to them again?")
q6=Question.create(title: "When will my child start crawling?")
q7=Question.create(title: "When kinds of solids can I start giving my child?")
q8=Question.create(title: "How much formula should my baby be drinking at 3 months?")
q9=Question.create(title: "What cream is best recommended if my baby gets a diaper rash?")
q10=Question.create(title: "When should I start bathing my baby?")








a1=Answer.create(title: "At approximately one years old",user_id: u1.id, question_id: q1.id)
a2=Answer.create(title: "At approximately one and a half years old",user_id: u2.id, question_id: q2.id)
a3=Answer.create(title: "At 6 months of age",user_id: u3.id, question_id: q3.id)
a4=Answer.create(title: "At 4 months of age",user_id: u2.id, question_id: q4.id)
a5=Answer.create(title: "2-3 days",user_id: u1.id,question_id: q5.id)
a6=Answer.create(title: "At approximately 9 months of age", user_id: u3.id ,question_id: q6.id)
a7=Answer.create(title: "You can start giving apple puree,boilded/blended carrots and bannanas",user_id: u2.id,question_id: q7.id)
a8=Answer.create(title: "Approximately 4oz every 3 hours",user_id: u1.id, question_id: q8.id)
a9=Answer.create(title: "Desitin",user_id: u3.id, question_id: q9.id)
a10=Answer.create(title: "After their belly button falls out- about a week after birth",user_id: u2.id, question_id: q10.id)









