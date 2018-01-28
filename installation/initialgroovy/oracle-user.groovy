import jenkins.model.*

import hudson.model.*

  

def inst = Jenkins.getInstance()

def desc = inst.getDescriptor("hudson.tools.JDKInstaller")

println desc.doPostCredential('saurabhvajpayee2010@gmail.com','Spicem5350')
