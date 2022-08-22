
*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    JSONLibrary
Library    os

#   POST    https://restful-booker.herokuapp.com/auth
#   POST    https://restful-booker.herokuapp.com/booking
#   GET     https://restful-booker.herokuapp.com/booking/1326
#   DELETE  https://restful-booker.herokuapp.com/booking/1326
#   TOKEN   4970aa218ccac9e

*** Variables ***
${BASE_URL}                 https://restful-booker.herokuapp.com
${POST_ENDPOINT}            /auth
${POST_ENDPOINT_CREATE}     /booking
${GET_ENDPOINT}             /booking/1326
${DELETE_ENDPOINT}          /booking/1326

*** Test Cases ***
Create a new authorization "token"
    [Tags]    POST_auth
    ${BODY}     load json from file    Resources/Body_JSON_auth
    ${HEADER}   create dictionary    Content-Type=application/json
    log to console    ${BODY}
    create session   Booker      ${BASE_URL}
    ${RESPONSE}     post on session     Booker    ${POST_ENDPOINT}    json=${BODY}   headers=${HEADER}
    ${POST_RESPONSE}     convert to string  ${RESPONSE}
    ${STATUS_CODE}  convert to string    ${RESPONSE.status_code}
    should be equal     ${STATUS_CODE}  200
    ${RESPONSE_BODY}    convert to string    ${RESPONSE.content}
    log to console    ${RESPONSE_BODY}

Create a new reservation
    [Tags]    POST_create
    ${BODY}     load json from file    Resources/Body_JSON_create
    ${HEADER}   create dictionary    Content-Type=application/json
    log to console    ${BODY}
    create session   Booker      ${BASE_URL}
    ${RESPONSE}     post on session     Booker    ${POST_ENDPOINT_CREATE}    json=${BODY}   headers=${HEADER}
    ${POST_RESPONSE}     convert to string  ${RESPONSE}
    ${STATUS_CODE}  convert to string    ${RESPONSE.status_code}
    should be equal     ${STATUS_CODE}  200
    ${RESPONSE_BODY}    convert to string    ${RESPONSE.content}
    log to console    ${RESPONSE_BODY}

Get a specific booking based on a given "bookingid"
    [Tags]    GET_before
    create session   Booker     ${BASE_URL}
    ${GET_RESPONSE}     get on session      Booker   ${GET_ENDPOINT}
    log to console      ${GET_Response.status_code}
    ${STATUS_CODE}    convert to string     ${GET_Response.status_code}
    should be equal    ${STATUS_CODE}   200

Delete the created reservation using the authorization "token"
    [Tags]    DELETE
    create session   Booker     ${BASE_URL}
    ${HEADER}   create dictionary    Content-Type=application/json      Cookie=token=4970aa218ccac9e
    ${RESPONSE}     delete request     Booker    ${DELETE_ENDPOINT}     headers=${HEADER}
    ${STATUS_CODE}    convert to string     ${Response.status_code}
    should be equal    ${STATUS_CODE}   201

Get a specific booking based on a given "bookingid" after delete
    [Tags]    GET_after
    create session   Booker     ${BASE_URL}
    ${GET_RESPONSE}     get on session      Booker   ${GET_ENDPOINT}
    log to console      ${GET_Response.status_code}
    ${STATUS_CODE}    convert to string     ${GET_Response.status_code}
    should be equal    ${STATUS_CODE}   404

