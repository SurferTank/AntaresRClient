source("../../R/antares-lib.R")

test_that("message sends", {
  #struct <- rjson::fromJSON(file = "/docs/projects/www/antares/AntaresClient/tests/testthat/data/test_msg.json")
  #later on we have to rely on the ini file...
  message_sender <- get_message_sender(url="http://localhost:8000/antares/msg/api/message/", token="96ded62c88a8bf28bab650ddde98b3f292d17892")
  message_sender$send_message(type = "account_form", body_fields = {'someVariableOnMessage': 100})
})

testthat("nude test", {
  test.message <- "{\"action\":\"create\",\"documents\":[{\"type\":\"account_form\",\"post_date\":\"2001-01-01T00:00:00+3\",\"create_summary\":false,\"header\":{\"period\":2001},\"fields\":{\"someVariableOnMessage\":100.1}}]}"
  token = "96ded62c88a8bf28bab650ddde98b3f292d17892"

  url = "http://localhost:8000/antares/msg/api/message/"


  RCurl::postForm(url,
           .opts = list(postfields = test.message,
                        httpheader = c('Content-Type' = 'application/json',
                                       Accept = 'application/json',
                                       "Authorization"=paste("Token ", token))))


})
