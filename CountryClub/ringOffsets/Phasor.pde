// Loops from 0 to 1 over time
class Phasor {
  float phase;
  float inc;

  Phasor(float inc) {
    phase = 0.0; // Current phase
    this.inc = inc; // Increment phase
  }

  // Update the phase
  void update() {
    phase += inc;

    // Keep phase between 0 and 1
    while (phase > 1) {
      phase -= 1;
    }
    while (this.phase < 0) {
      phase += 1;
    }
  };
}