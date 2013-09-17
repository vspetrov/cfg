#!/usr/bin/python
from os.path import expanduser
import os
import shutil

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
    os.system('tar -xzf '+data_dir+'/magit-1.2.0.tar.gz')
    os.system('tar -xzf '+data_dir+'/color-theme-6.6.0.tar.gz')
    os.system('mkdir sr_speedbar && cp '+data_dir+'/sr-speedbar.el sr_speedbar/')
    os.system('mkdir highlight_symbol && cp '+data_dir+'/highlight-symbol.el highlight_symbol/')
    os.system('tar -xjf '+data_dir+'/auto-complete-1.3.1.tar.bz2 && cd auto-complete-1.3.1 && make byte-compile && cd ..')

    print "installing yasnippet"
    os.system('mkdir yasnippet_bundle')
    os.system('tar -xzf '+data_dir+'/yasnippet-bundle-0.6.1c.el.tgz')
    os.system('mv yasnippet-bundle.el yasnippet_bundle/')

    print "installing fill-column-indicator"
    os.system('mkdir fill-column-indicator')
    os.system('cp '+data_dir+'/fill-column-indicator.el fill-column-indicator')
    print "Emacs Install complete"

if __name__ == '__main__':
    main()
