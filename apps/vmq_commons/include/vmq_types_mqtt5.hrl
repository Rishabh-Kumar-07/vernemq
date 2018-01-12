-include_lib("vernemq_dev/include/vernemq_dev.hrl").

-type routing_key()         :: [binary()].
-type msg_ref()             :: binary().

-type message_id()          :: undefined | 0..65535.

-record(mqtt5_connect, {
          proto_ver         :: 5,
          username          :: username(),
          password          :: password(),
          clean_start       :: flag(),
          keep_alive        :: non_neg_integer(),
          client_id         :: client_id(),
          will_properties   :: [mqtt5_will_property()],
          will_retain       :: flag(),
          will_qos          :: qos(),
          will_topic        :: topic(),
          will_msg          :: payload(),
          properties        :: [mqtt5_property()] | undefined
         }).
-type mqtt5_connect()        :: #mqtt5_connect{}.

-type mqtt5_will_property() :: p_will_delay_interval()
                             | p_payload_format_indicator()
                             | p_message_expiry_interval()
                             | p_content_type()
                             | p_response_topic()
                             | p_correlation_data()
                             | user_property().

%% -record(mqtt5_connack, {
%%           session_present   :: flag(),
%%           return_code       :: return_code()
%%          }).
%% -type mqtt5_connack()        :: #mqtt5_connack{}.

%% -record(mqtt5_publish, {
%%           message_id        :: message_id(),
%%           topic             :: topic(),
%%           qos               :: qos(),
%%           retain            :: flag(),
%%           dup               :: flag(),
%%           payload           :: payload()
%%         }).
%% -type mqtt5_publish()       :: #mqtt5_publish{}.

%% -record(mqtt5_puback, {
%%           message_id        :: message_id()
%%          }).
%% -type mqtt5_puback()        :: #mqtt5_puback{}.

%% -record(mqtt5_pubrec, {
%%           message_id        :: message_id()
%%          }).
%% -type mqtt5_pubrec()        :: #mqtt5_pubrec{}.

%% -record(mqtt5_pubrel, {
%%           message_id        :: message_id()
%%          }).
%% -type mqtt5_pubrel()        :: #mqtt5_pubrel{}.

%% -record(mqtt5_pubcomp, {
%%           message_id        :: message_id()
%%          }).
%% -type mqtt5_pubcomp()       :: #mqtt5_pubcomp{}.

%% -record(mqtt5_subscribe, {
%%           message_id        :: message_id(),
%%           topics=[]         :: [{topic(), qos()}]
%%          }).
%% -type mqtt5_subscribe()     :: #mqtt5_subscribe{}.

%% -record(mqtt5_unsubscribe, {
%%           message_id        :: message_id(),
%%           topics=[]         :: [topic()]
%%          }).
%% -type mqtt5_unsubscribe()   :: #mqtt5_unsubscribe{}.

%% -record(mqtt5_suback, {
%%           message_id        :: message_id(),
%%           qos_table=[]      :: [qos()]
%%          }).
%% -type mqtt5_suback()        :: #mqtt5_suback{}.

%% -record(mqtt5_unsuback, {
%%           message_id        :: message_id()
%%          }).
%% -type mqtt5_unsuback()      :: #mqtt5_unsuback{}.

%% -record(mqtt5_pingreq, {}).
%% -type mqtt5_pingreq()       :: #mqtt5_pingreq{}.

%% -record(mqtt5_pingresp, {}).
%% -type mqtt5_pingresp()      :: #mqtt5_pingresp{}.

%% -record(mqtt5_disconnect, {}).
%% -type mqtt5_disconnect()    :: #mqtt5_disconnect{}.

-type mqtt5_frame()         :: mqtt5_connect()
                             %% | mqtt5_connack()
                             %% | mqtt5_publish()
                             %% | mqtt5_puback()
                             %% | mqtt5_pubrec()
                             %% | mqtt5_pubrel()
                             %% | mqtt5_pubcomp()
                             %% | mqtt5_subscribe()
                             %% | mqtt5_suback()
                             %% | mqtt5_unsubscribe()
                             %% | mqtt5_unsuback()
                             %% | mqtt5_pingreq()
                             %% | mqtt5_pingresp()
                             %% | mqtt5_disconnect()
                               .

-define(GRANTED_QOS0, granted_qos0).
-define(GRANTED_QOS1, granted_qos1).
-define(GRANTED_QOS2, granted_qos2).
-define(DISCONNECT_WITH_WILL_MSG, disconnect_with_will_msg).
-define(NO_MATCHING_SUBSCRIBERS, no_matching_subscribers).
-define(NO_SUBSCRIPTION_EXISTED, no_subscription_existed).
-define(CONTINUE_AUTHENTICATION, continue_authentication).
-define(REAUTHENTICATE, reauthenticate).
-define(UNSPECIFIED_ERROR, unspecified_error).
-define(MALFORMED_PACKET, malformed_packet).
-define(PROTOCOL_ERROR, protocol_error).
-define(IMPL_SPECIFIC_ERROR, impl_specific_error).
-define(UNSUPPORTED_PROTOCOL_VERSION, unsupported_protocol_version).
-define(CLIENT_IDENTIFIER_NOT_VALID, client_identifier_not_valid).
-define(BAD_USERNAME_OR_PASSWORD, bad_username_or_password).
-define(NOT_AUTHORIZED, not_authorized).
-define(SERVER_UNAVAILABLE, server_unavailable).
-define(SERVER_BUSY, server_busy).
-define(BANNED, banned).
-define(SERVER_SHUTTING_DOWN, server_shutting_down).
-define(BAD_AUTHENTICATION_METHOD, bad_authentication_method).
-define(KEEP_ALIVE_TIMEOUT, keep_alive_timeout).
-define(SESSION_TAKEN_OVER, session_taken_over).
-define(TOPIC_FILTER_INVALID, topic_filter_invalid).
-define(TOPIC_NAME_INVALID, topic_name_invalid).
-define(PACKET_ID_IN_USE, packet_id_in_use).
-define(PACKET_ID_NOT_FOUND, packet_id_not_found).
-define(RECEIVE_MAX_EXCEEDED, receive_max_exceeded).
-define(TOPIC_ALIAS_INVALID, topic_alias_invalid).
-define(PACKET_TOO_LARGE, packet_too_large).
-define(MESSAGE_RATE_TOO_HIGH, message_rate_too_high).
-define(QUOTA_EXCEEDED, quota_exceeded).
-define(ADMINISTRATIVE_ACTION, administrative_action).
-define(PAYLOAD_FORMAT_INVALID, payload_format_invalid).
-define(RETAIN_NOT_SUPPORTED, retain_not_supported).
-define(QOS_NOT_SUPPORTED, qos_not_supported).
-define(USE_ANOTHER_SERVER, use_another_server).
-define(SERVER_MOVED, server_moved).
-define(SHARED_SUBS_NOT_SUPPORTED, shared_subs_not_supported).
-define(CONNECTION_RATE_EXCEEDED, connection_rate_exceeded).
-define(MAX_CONNECT_TIME, max_connect_time).
-define(SUBSCRIPTION_IDS_NOT_SUPPORTED, subscription_ids_not_supported).
-define(WILDCARD_SUBS_NOT_SUPPORTED, wildcard_subs_not_supported).

-type reason_type()              :: granted_qos0
                                  | granted_qos1
                                  | granted_qos2
                                  | disconnect_with_will_msg
                                  | no_matching_subscribers
                                  | no_subscription_existed
                                  | continue_authentication
                                  | reauthenticate
                                  | unspecified_error
                                  | malformed_packet
                                  | protocol_error
                                  | impl_specific_error
                                  | unsupported_protocol_version
                                  | client_identifier_not_valid
                                  | bad_username_or_password
                                  | not_authorized
                                  | server_unavailable
                                  | server_busy
                                  | banned
                                  | server_shutting_down
                                  | bad_authentication_method
                                  | keep_alive_timeout
                                  | session_taken_over
                                  | topic_filter_invalid
                                  | topic_name_invalid
                                  | packet_id_in_use
                                  | packet_id_not_found
                                  | receive_max_exceeded
                                  | topic_alias_invalid
                                  | packet_too_large
                                  | message_rate_too_high
                                  | quota_exceeded
                                  | administrative_action
                                  | payload_format_invalid
                                  | retain_not_supported
                                  | qos_not_supported
                                  | use_another_server
                                  | server_moved
                                  | shared_subs_not_supported
                                  | connection_rate_exceeded
                                  | max_connect_time
                                  | subscription_ids_not_supported
                                  | wildcard_subs_not_supported.

%% TODO: these are only preliminary types so we had something to use
%% below. Should probable be replaced with something else.
-type utf8string() :: binary().
-type user_property() :: {utf8string(), utf8string()}.
-type seconds() :: non_neg_integer().

%% MQTT5 property records and types
-record(p_payload_format_indicator, {
          value :: unspecified | utf8
         }).
-type p_payload_format_indicator() :: #p_payload_format_indicator{}.

-record(p_message_expiry_interval, {value :: seconds()}).
-type p_message_expiry_interval() :: #p_message_expiry_interval{}.

-record(p_content_type, {value :: utf8string()}).
-type p_content_type() :: #p_content_type{}.

-record(p_response_topic, {value :: topic()}).
-type p_response_topic() :: #p_content_type{}.

-record(p_correlation_data, {value :: binary()}).
-type p_correlation_data() :: #p_correlation_data{}.

-record(p_subscription_id, {value :: 1..268435455}).
-type p_subscription_id() :: #p_subscription_id{}.

-record(p_session_expiry_interval, {value :: seconds()}).
-type p_session_expiry_interval() :: #p_session_expiry_interval{}.

-record(p_assigned_client_id, {value :: utf8string()}).
-type p_assigned_client_id() :: #p_assigned_client_id{}.

-record(p_server_keep_alive, {value :: seconds()}).
-type p_server_keep_alive() :: #p_server_keep_alive{}.

-record(p_authentication_method, {value :: utf8string()}).
-type p_authentication_method() :: #p_authentication_method{}.

-record(p_authentication_data, {value :: binary()}).
-type p_authentication_data() :: #p_authentication_data{}.

-record(p_request_problem_info, {value :: boolean()}).
-type p_request_problem_info() :: #p_request_problem_info{}.

-record(p_will_delay_interval, {value :: seconds()}).
-type p_will_delay_interval() :: #p_will_delay_interval{}.

-record(p_request_response_info, {value :: boolean()}).
-type p_request_response_info() :: #p_request_response_info{}.

-record(p_response_info, {value :: utf8string()}).
-type p_response_info() :: #p_response_info{}.

-record(p_server_ref, {value :: utf8string()}).
-type p_server_ref() :: #p_server_ref{}.

-record(p_reason_string, {value :: utf8string()}).
-type p_reason_string() :: #p_reason_string{}.

-record(p_receive_max, {value :: 1..65535}).
-type p_receive_max() :: #p_receive_max{}.

-record(p_topic_alias_max, {value :: 0..65535}).
-type p_topic_alias_max() :: #p_topic_alias_max{}.

-record(p_topic_alias, {value :: 1..65535}).
-type p_topic_alias() :: #p_topic_alias{}.

%% Spec: It is a Protocol Error to include Maximum QoS more than once,
%% or to have a value other than 0 or 1. If the Maximum QoS is absent,
%% the Client uses a Maximum QoS of 2.
%%
%% TODO: Maybe we want to explicity model qos2 as well as that might
%% be easier to handle in the code - in that case we should extend
%% this type to include 2.q
-record(p_max_qos, {value :: 0 | 1}).
-type p_max_qos() :: #p_max_qos{}.

-record(p_retain_available, {value :: boolean()}).
-type p_retain_available() :: #p_retain_available{}.

-record(p_user_property, {value :: user_property()}).
-type p_user_property() :: #p_user_property{}.

-record(p_max_packet_size, {value :: 1..4294967296}).
-type p_max_packet_size() :: #p_max_packet_size{}.

-record(p_wildcard_subs_available, {value :: boolean()}).
-type p_wildcard_subs_available() :: #p_wildcard_subs_available{}.

-record(p_sub_ids_available, {value :: boolean()}).
-type p_sub_ids_available() :: #p_sub_ids_available{}.

-record(p_shared_subs_available, {value :: boolean()}).
-type p_shared_subs_available() :: #p_shared_subs_available{}.

-type mqtt5_property() :: p_payload_format_indicator()
                        | p_message_expiry_interval()
                        | p_content_type()
                        | p_response_topic()
                        | p_correlation_data()
                        | p_subscription_id()
                        | p_session_expiry_interval()
                        | p_assigned_client_id()
                        | p_server_keep_alive()
                        | p_authentication_method()
                        | p_authentication_data()
                        | p_request_problem_info()
                        | p_will_delay_interval()
                        | p_request_response_info()
                        | p_response_info()
                        | p_server_ref()
                        | p_reason_string()
                        | p_receive_max()
                        | p_topic_alias_max()
                        | p_topic_alias()
                        | p_max_qos()
                        | p_retain_available()
                        | p_user_property()
                        | p_max_packet_size()
                        | p_wildcard_subs_available()
                        | p_sub_ids_available()
                        | p_shared_subs_available().
