if !([ $INSTANCEID ]); then
    export INSTANCEID=`ec2-metadata -i | awk '{print $2}'`
fi

if !([ $AWS_DEFAULT_REGION ]); then
    AZONE=`ec2-metadata -z | awk '{print $2}'`
    export AWS_DEFAULT_REGION=${AZONE%?}
fi

aws ec2 modify-instance-credit-specification \
--region "$AWS_DEFAULT_REGION" \
--instance-credit-specification \
"[{\"InstanceId\": \"$INSTANCEID\",\"CpuCredits\": \"unlimited\"}]"
