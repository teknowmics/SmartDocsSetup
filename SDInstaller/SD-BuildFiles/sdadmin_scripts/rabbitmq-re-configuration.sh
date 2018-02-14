service rabbitmq-server start;
rabbitmqctl stop_app
rabbitmqctl reset
rabbitmqctl start_app
rabbitmq-plugins enable rabbitmq_management
rabbitmqctl add_vhost sdrmq
rabbitmqctl add_user smartdocs smartdocs
rabbitmqctl set_user_tags smartdocs administrator
rabbitmqctl set_permissions -p sdrmq smartdocs "." "." ".*"
