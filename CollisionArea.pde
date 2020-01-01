import java.util.Set;
import java.util.function.Consumer;

final class CollisionArea
{
    private final Circle area;
    private final Set<Particle> particles;

    CollisionArea(final Set<Particle> particles, final Circle area)
    {
        this.area = area;
        this.particles = particles;
    }

    public Collection<Collision> getCollisions()
    {
        final Set<Collision> collisions = new HashSet<Collision>();
        final Set<Particle> remainingParticles = new HashSet<Particle>(this.particles);
        for(final Particle firstParticle: new HashSet<Particle>(this.particles))
        {
            remainingParticles.remove(firstParticle);
            for(final Particle secondParticle: remainingParticles)
            {
                if(firstParticle.isCollidingWith(secondParticle))
                {
                    collisions.add(new Collision(firstParticle, secondParticle));
                }
            }
        }
        return collisions;
    }

    public void print()
    {
        this.setupAreaPrint();
        this.area.print();

        this.setupParticlePrint();
        for(final Particle particle: this.particles)
        {
            particle.print();
        }
    }

    private void setupAreaPrint()
    {
        color trensparentGrey = color(80, 80, 80, 60);
        fill(trensparentGrey);
        noStroke();
    }

    private void setupParticlePrint()
    {
        color trensparentGrey = color(40, 40, 128);
        fill(trensparentGrey);
        noStroke();
    }
}
