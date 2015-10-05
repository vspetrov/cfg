#!/usr/bin/python
from os.path import expanduser
import os
import shutil
from subprocess import call

def main():
    print 'Installing emacs configs...'
    print 'Making a symbolic link emacs_cfg -> ~/.emacs'
    home_dir = expanduser("~")
    cwd_dir = os.getcwd()
    data_dir = os.path.join(cwd_dir,'data')

    print 'cwd_dir: ',cwd_dir
    print 'home_dir: ',home_dir
    if not os.path.exists(os.path.join(home_dir,'.emacs')):
        os.symlink(os.path.join(cwd_dir,'emacs_cfg'),
                    os.path.join(home_dir,'.emacs'))

    print 'Unpaking data archives'
    if os.path.exists('install'):
        shutil.rmtree('install')
    os.mkdir('install')
    os.chdir('install')
    os.system('git clone https://github.com/magnars/dash.el.git')
    os.system('git clone https://github.com/magit/magit.git')
    os.system('tar -xzf '+data_dir+'/color-theme-6.6.0.tar.gz')
    os.system('mkdir sr_speedbar && cp '+data_dir+'/sr-speedbar.el sr_speedbar/')
    os.system('mkdir monokai-theme && cp '+data_dir+'/monokai-emacs-master/monokai-theme.el monokai-theme/')
    os.system('mkdir highlight_symbol && cp '+data_dir+'/highlight-symbol.el highlight_symbol/')
    os.system('tar -xjf '+data_dir+'/auto-complete-1.3.1.tar.bz2 && cd auto-complete-1.3.1 && make byte-compile && cd ..')

    print "installing yasnippet"
    os.system('mkdir yasnippet_bundle')
    os.system('tar -xzf '+data_dir+'/yasnippet-bundle-0.6.1c.el.tgz')
    os.system('mv yasnippet-bundle.el yasnippet_bundle/')

#    print "installing fill-column-indicator"
#    os.system('mkdir fill-column-indicator')
#    os.system('cp '+data_dir+'/fill-column-indicator.el fill-column-indicator')


    print "installing xscope"
    os.system('mkdir xcscope')
    os.system('cp '+data_dir+'/xcscope.el xcscope')

    print "installing ws-trim"
    os.system('mkdir ws_trim')
    os.system('cp '+data_dir+'/ws-trim.el ws_trim')

#    call(["git","clone","https://github.com/dkogan/xcscope.el.git","xcscope"])

    print "Emacs Install complete"

if __name__ == '__main__':
    main()
