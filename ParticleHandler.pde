import java.util.Set;
import java.util.HashSet;

final class ParticleHandler
{
    private final Set<Particle> particles;

    public ParticleHandler()
    {
        this.particles = new HashSet<Particle>();
    }

    void addParticle(final Particle particle)
    {
        this.particles.add(particle);
    }
    
    void actualizeParticles()
    {
        for(final Particle particle: new ArrayList<Particle>(this.particles))
        {
            if(particle.hasFinishedToActualize())
            {
                this.particles.remove(particle); //<>//
            }
            else
            {
                particle.actualize();
            }
        }
    }
}
