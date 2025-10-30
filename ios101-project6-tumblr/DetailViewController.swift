//
//  DetailViewController.swift
//  ios101-project6-tumblr
//
//  Created by Nafin V. on 10/30/25.
//

// Swift
import UIKit
import NukeExtensions

class DetailViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!

    var post: Post!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Ensure outlets are ready and post was set
        guard let post = post else { return }

        // UI configuration
        imageView.contentMode = .scaleAspectFit
        textView.isEditable = false
        textView.text = post.caption.trimHTMLTags()

        // Load first photo (if any)
        if let url = post.photos.first?.originalSize.url {
            NukeExtensions.loadImage(with: url, into: imageView)
        } else {
            imageView.image = nil
        }
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
