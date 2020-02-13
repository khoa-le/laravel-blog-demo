aws deploy create-deployment \
--application-name laravel \
--deployment-config-name CodeDeployDefault.OneAtATime \
--deployment-group-name laravel_blog_deployment_group \
--description "CodeDeploy Demo Deployment" \
--github-location repository=khoa-le/laravel-blog-demo,commitId=$(git rev-parse HEAD)
