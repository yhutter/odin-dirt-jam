# Compile Shaders
cd src
sokol-shdc -i triangle.glsl -l metal_macos -f sokol_odin -o triangle.odin
odin run .