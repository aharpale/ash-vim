/usr/bin/clang -c -I. -Iproto -DHAVE_CONFIG_H   -F/usr/local/Frameworks -DMACOS_X_UNIX -no-cpp-precomp  -Os -w -pipe -march=native -Xclang -target-feature -Xclang -aes -Qunused-arguments -mmacosx-version-min=10.8 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1      
/usr/bin/clang -L. -L/usr/local/lib -F/usr/local/Frameworks -o vim        -lm  -lncurses -liconv -framework Cocoa    -framework Python   -lruby -lobjc

