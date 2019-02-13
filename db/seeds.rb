u1 = User.create(
  slack_id: "U91CXSUN4",
  taco_count: 1000
)

u2 = User.create(
  slack_id: "U91CXSU23",
  taco_count: 1000
)



ShoutOut.create(
  receiver: u1, sender: u2, message: "hi"
)


