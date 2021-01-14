#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export ANDROID_SDK_ROOT=/opt/android-sdk
export ANDROID_HOME=$ANDROID_SDK_ROOT

export PATH=$PATH:$ANDROID_SDK_ROOT/platforms/
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools/
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin/

source ~/.profile
