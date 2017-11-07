

#' @importFrom R6 R6Class
MessageSender.class <- R6::R6Class("AntaresMessage", public = list(url = NA, token = NA,
  initialize =
    function(url=NA, token=NA) {
      if(is.na(url))
      {
        self$url = get_config_value("defaults", "url")
      }
      else{
        self$url = url
      }
      if(is.na(token))
      {
        self$url = get_config_value("defaults", "token")
      }
      else{
        self$token = token
      }

},
send_message = function(type,  body_fields, header_fields=NA, action="create", post_date=sys.date(), create_summary=False){
  message = self$construct_message(type, header_fields, body_fields, action, post_date, create_summary)
  if(is.na(self$token))
  {
    postForm(self$url,
           .opts = list(postfields = message,
                        httpheader = c('Content-Type' = 'application/json',
                                       Accept = 'application/json',
                                       "Authorization"=paste("Token ", self$token))))
  }else
  {
    postForm(self$url,
             .opts = list(postfields = message,
                          httpheader = c('Content-Type' = 'application/json',
                                         Accept = 'application/json')))
  }
},
construct_message = function(type, header_fields, body_fields, action, post_date, create_summary){
  message = list()
  message$action = action



}))

#' Constructs an AntaresMessageSender.class
#'
#' @import futile.logger RCurl rjson
#' @export
get_message_sender <- function(url=NA, token=NA)
{
  return (MessageSender.class$new(url, token))
}
