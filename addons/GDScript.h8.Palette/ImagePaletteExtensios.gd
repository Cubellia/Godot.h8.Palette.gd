class_name ImagePaletteExtensions

static func create_image(palette: ImagePalette) -> Image:
	var image: Image = Image.create_empty(palette.get_count(), 1, false, Image.FORMAT_RGBA8)

	for i in range(palette.get_count()):
		image.set_pixel(i, 0, palette.get_color(i))

	return image

static func create_texture(palette: ImagePalette) -> Texture:
	return ImageTexture.new().create_from_image(create_image(palette))

static func create_gradient(palette: ImagePalette) -> Gradient:
	var gradient:Gradient = Gradient.new()
	var pointoffset:float = 1.0/palette.ColorsInPalette.size()
	for i in palette.ColorsInPalette.size():
		gradient.add_point(pointoffset*i,palette.ColorsInPalette[i].color)
	gradient.remove_point(0) #by default, gradient adds a black and a white point at the start
	gradient.remove_point(0)
	return gradient

static func create_gradient_1d(color_gradient: Gradient) -> GradientTexture1D:
	var g1d: GradientTexture1D = GradientTexture1D.new()
	g1d.set_gradient(color_gradient)
	g1d.width = color_gradient.get_point_count()
	return g1d
