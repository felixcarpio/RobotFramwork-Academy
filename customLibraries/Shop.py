from robot.api.deco import library, keyword

@library
class Shop:
    @keyword
    def hello_world(self):
        print("hello")


    @keyword
    def 