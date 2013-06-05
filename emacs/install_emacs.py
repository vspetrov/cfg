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
    os.system('unzip '+data_dir+'/emacs-color-theme-solarized-master.zip')
    os.system('mkdir sr_speedbar && cp '+data_dir+'/sr-speedbar.el sr_speedbar/')
if __name__ == '__main__':
    main()
