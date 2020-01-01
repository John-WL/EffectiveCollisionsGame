public final class ParticleHandler
{
    private final Set<Particle> particles;

    public ParticleHandler()
    {
        this.particles = new HashSet<Particle>();
    }

    public void addParticle(final Particle particle)
    {
        this.particles.add(particle);
    }
    
    public void actualizeParticles()
    {
        for(final Particle particle: new ArrayList<Particle>(this.particles))
        {
            if(particle.hasFinishedToActualize())
            {
                this.particles.remove(particle); //<>//
            }
            else
            { //<>//
                particle.actualize();
            }
        }
    }

    public final Consumer<Particle> collidingParticleConsumer = new Consumer<Particle>()
    {
        @Override
        public void accept(final Particle particle)
        {
            ParticleHandler.this.addParticle(particle);
        }
    };
}
