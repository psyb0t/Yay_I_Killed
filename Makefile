build:
	@mkdir -p build
	@cp LICENSE Yay_I_Killed/
	@zip -r build/Yay_I_Killed.zip Yay_I_Killed
	@rm Yay_I_Killed/LICENSE
clean:
	@rm -rf build
