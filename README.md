# Cheatsheet Lab 5


## Window

`pygame.display.set_mode((width, height))`

`window.fill(color)`

`pygame.display.set_caption(‘Window Name’)`


## Color

`color = (r, g, b)`

## Position

`position = (x, y)`

## Rectangle

`rect = (x, y, width, height)`

https://www.w3schools.com/colors/colors_picker.asp

## Clock

`pygame.time.Clock().tick(60)`

## Graphics

`pygame.draw.line(window, color, start_position, end_position)`

`pygame.draw.rect(window, color, rect)`

`pygame.draw.polygon(window, color, pointList)`

`pygame.draw.circle(window, color ,position, radius)`

`pygame.draw.ellipse(window, color, rect)`

`pygame.draw.arc(window, color, rect,°begin,°end)`

`pygame.draw.line(window, color, start, end)`

`pygame.draw.lines(window, color, pointList)`

 
## Images

`image = pygame.image.load(“path”)`

`image_rect = image.get_rect()`

`window.blit(image, image_rect)`
