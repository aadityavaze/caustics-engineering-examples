using Pkg
Pkg.activate(".")

using Images, CausticsEngineering

image = Images.load("./examples/8.jpg") # Check current working directory with pwd()
engineer_caustics(image);
