FOR /L %%A IN (1,1,119) DO (
    magick convert gif-%%A.png gif-%%A.gif
)
del *.png