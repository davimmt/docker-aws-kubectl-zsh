alias v=nvim
alias cpf=copyfile

alias vf='v $(fzf)'
alias cf='cat $(fzf)'
alias bf='bat $(fzf)'
alias curlg="curl -sSL -o /dev/null -D - "
curlt() {
    curl -w @- -o /dev/null -s "$@" <<'EOF'
    time_namelookup:  %{time_namelookup}\n
       time_connect:  %{time_connect}\n
    time_appconnect:  %{time_appconnect}\n
   time_pretransfer:  %{time_pretransfer}\n
      time_redirect:  %{time_redirect}\n
 time_starttransfer:  %{time_starttransfer}\n
                    ----------\n
         time_total:  %{time_total}\n
EOF
}
ff() { find . -type f -wholename "*$1*" }
fd() { find . -type d -wholename "*$1*" }
b64() { echo -n "$1" | base64 }
b64d() { echo -e "$1" | base64 -d }

# Git
alias g="git "
alias gpo="git pull origin "
alias gcam="git add .; git commit -a -m "
alias ga="git add "
alias gp="git push "
alias gs="git status "
alias gd="git diff "

# AWS
export AWS_REGION=sa-east-1 AWS_DEFAULT_REGION=sa-east-1
alias awssa="export AWS_REGION=sa-east-1 AWS_DEFAULT_REGION=sa-east-1"
alias awsus="export AWS_REGION=us-east-1 AWS_DEFAULT_REGION=us-east-1"
alias id="aws sts get-caller-identity"
alias ssm="aws ssm start-session --target "
adi() { aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" "Name=tag:Name,Values=*$1*" --query "Reservations[*].Instances[*].{id: InstanceId, name: Tags[?Key=='Name'] | [0].Value, env: Tags[?Key=='Environment'] | [0].Value, ip: PrivateIpAddress, squad: Tags[?Key=='Squad'] | [0].Value}" --output table }

# Kubectl
alias k=kubectl
alias kg="kubectl get "
alias kd="kubectl describe "
alias kl="kubectl logs -f "
alias ke="kubectl edit "
alias kx="kubectl exec -it "
alias kga="kubectl get ing,all,configmap,role,rolebinding,secret "
alias kgp="kubectl get po "
alias kgd="kubectl get deploy "
alias kgi="kubectl get ing "
alias kgs="kubectl get svc "
alias kgm="kubectl get configmap "

alias kdp="kubectl describe po "
alias kdd="kubectl describe deploy "
alias kds="kubectl describe svc "
alias kdi="kubectl describe ing "
alias kdm="kubectl describe configmap "

alias kep="kubectl edit po "
alias ked="kubectl edit deploy "
alias kes="kubectl edit svc "
alias kei="kubectl edit ing "
alias kem="kubectl edit configmap "

alias kdelp="kubectl delete po "
alias kdeld="kubectl delete deploy "
alias kdels="kubectl delete svc "
alias kdeli="kubectl delete ing "
alias kdelm="kubectl delete configmap "

alias kaf="kubectl apply -f "
alias kdf="kubectl delete -f "

alias kgaa="kubectl get all,ing,clusterrole,clusterrolebinding,secret,configmap -A"
alias kgap="kubectl get po -A"

alias kcu="aws eks update-kubeconfig --name "
alias kcn="kubectl config set-context --current --namespace "
alias kcc="kubectl config use-context "

# Terraform
alias tf="terraform "
alias tfi="terraform init "
alias tfv="terraform validate"
alias tfp="terraform plan "
alias tfa="terraform apply "
alias tfd="terraform destroy "
alias tfo="terraform output "
alias tfr="terraform refresh"
alias tfs="terraform state "