# This resource installs a jenkins instance.
#
# === Parameters
#
# === Variables
#
# === Examples
#
# === Authors
#
# Sander Bilo <sander.bilo@gmail.com>
#
# === Copyright
#
define jenkins::instance (
    $instance = $name,
    $jenkinsVersion  = 'latest') {
    if (!defined(Tomcat::Instance[$instance])) {
        tomcat::instance { $instance: }
    }

    if ($jenkinsVersion == 'latest') {
        warning('Using \'latest\'  version for Jenkins may have unwanted consequences, please specify a version number')
    }

    tomcat::war { 'jenkins.war':
        catalina_base => '/opt/apache-tomcat/tomcat8',
        war_source => "http://mirrors.jenkins-ci.org/war/$jenkinsVersion/jenkins.war",
      }

}