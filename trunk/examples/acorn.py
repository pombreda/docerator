# Make it possible to run this from docerator's root dir
import os
import sys
sys.path.append(os.getcwd())

import docerator

# for each size, have a (translation_x, scale_x, translation_y, scale_y) tuple:
acornRects = {
     16: ( -0.3762, 0.5597, -0.159,  0.4453),
     32: ( -0.5967, 0.5431, -0.3632, 0.5662),
    128: ( -3.0761, 0.6025, -2.0524, 0.6073),
    256: ( -6.394,  0.6081, -4.3167, 0.6117),
    512: (-13.0499, 0.611,  -8.8612, 0.6132)}

docerator.makedocicons(text=['JPG', 'PNG', 'TIFF'], rects=acornRects,
    appicon='/Applications/Acorn.app/Contents/Resources/Acorn.icns')

docerator.makedocicon(text='Acorn', rects=acornRects,
    appicon='/Applications/Acorn.app/Contents/Resources/Acorn.icns')
