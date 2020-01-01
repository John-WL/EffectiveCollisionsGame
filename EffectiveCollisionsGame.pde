import java.util.Collection;
import java.util.Set;
import java.util.HashSet;
import java.util.function.Consumer;

ProcessingApplication processingApplication;

void settings()
{
  if(ProcessingApplication.isWindowFullScreen())
  {
    fullScreen();
  }
  else
  {
    size(ProcessingApplication.windowSizeX(), ProcessingApplication.windowSizeY());
  }
}

void setup()
{
  processingApplication = new EffectiveCollisions();
}

void draw()
{
  processingApplication.step();
}

public static abstract class ProcessingApplication
{
  private static final int WINDOW_SIZE_X = 1000;
  private static final int WINDOW_SIZE_Y = 600;
  private static final boolean IS_WINDOW_FULLSCREEN = false;
  
  private static int windowSizeX = WINDOW_SIZE_X;
  private static int windowSizeY = WINDOW_SIZE_Y;
  public static boolean isWindowFullScreen = IS_WINDOW_FULLSCREEN;
  
  public static final void windowSizeX(int windowSizeX)
  {
      ProcessingApplication.windowSizeX = windowSizeX;
      throw new RuntimeException();
  }
  
  public static final int windowSizeX()
  {
      return windowSizeX;
  }
  
  public static final void windowSizeY(int windowSizeY)
  {
      ProcessingApplication.windowSizeY = windowSizeY;
      throw new RuntimeException();
  }
  
  public static final int windowSizeY()
  {
      return windowSizeY;
  }
  
  public static final void isWindowFullScreen(boolean isWindowFullScreen)
  {
      ProcessingApplication.isWindowFullScreen = isWindowFullScreen;
      throw new RuntimeException();
  }
  
  public static final boolean isWindowFullScreen()
  {
      return isWindowFullScreen;
  }
  
  public final void step()
  {
      backend();
      frontend();
  }
  
  public abstract void backend();
  public abstract void frontend();
}
