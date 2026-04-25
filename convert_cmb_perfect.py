import numpy as np
from PIL import Image
from scipy import ndimage

def convert_cmb_perfect(input_path, output_path):
    # Load image
    img = Image.open(input_path).convert('RGB')
    data = np.array(img).astype(float)
    
    # 1. Create a mask of anything that isn't white
    r, g, b = data[:,:,0], data[:,:,1], data[:,:,2]
    # We use a threshold of 245 to catch "almost white" noise
    raw_mask = (r < 245) | (g < 245) | (b < 245)
    
    # 2. Area-Based Filtering (The "Magic" Step)
    # This identifies every separate object in the image (the map, the legend, the dots)
    label_im, nb_labels = ndimage.label(raw_mask)
    
    # Find the size of every object
    sizes = ndimage.sum(raw_mask, label_im, range(nb_labels + 1))
    
    # The largest object is our CMB oval. We ignore everything else.
    # (Size index 0 is the background, so we look at 1 and above)
    map_label = np.argmax(sizes[1:]) + 1
    final_mask = (label_im == map_label)
    
    # 3. Scientific Grayscale Mapping
    # (r - b) highlights the temp difference
    gray_mapped = (r - b + 255) / 510.0 * 255
    gray_mapped = np.clip(gray_mapped, 0, 255).astype(np.uint8)
    
    # 4. Create the output with a pure white background
    height, width = r.shape
    output_data = np.full((height, width), 255, dtype=np.uint8)
    
    # Apply the mapping only to the largest blob (the map)
    output_data[final_mask] = gray_mapped[final_mask]
    
    # 5. Save
    Image.fromarray(output_data, mode='L').save(output_path)
    print(f"Perfected image saved to {output_path}")

# Run
file_in = "/Users/kevin/papers/math/cmb/moll_temp_v2.jpg"
file_out = "/Users/kevin/papers/math/cmb/moll_temp_v2_perfected.jpg"
convert_cmb_perfect(file_in, file_out)
