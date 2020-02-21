//
//  NoteViewController.swift
//  JSNote
//
//  Created by 박진수 on 16/02/2020.
//  Copyright © 2020 박진수. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: JSTextView!
    @IBOutlet weak var imageCollectionView: UICollectionView!
    @IBOutlet weak var leftBarBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = ""
        self.scrollView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(touchSrollView)))
        titleTextField.delegate = self
        contentTextView.delegate = self
        contentTextView.jsDelegate = self
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        contentTextView.text = "내용을 입력하세요."
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @objc func touchSrollView() {
        self.view.endEditing(true)
    }
    
    @IBAction func touchLeftBarButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setPlaceholder(to textView: UITextView) {
        if textView.text == "내용을 입력하세요." {
            textView.text = ""
            textView.textColor = .black
        }
        else if textView.text == "" {
            textView.text = "내용을 입력하세요."
            textView.textColor = .lightGray
        }
    }

    @IBAction func addImage(_ sender: Any) {
        let alertVC = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alertVC.addAction(UIAlertAction(title: "앨범에서 선택", style: .default, handler: nil))
        alertVC.addAction(UIAlertAction(title: "직접 촬영하기", style: .default, handler: nil))
        alertVC.addAction(UIAlertAction(title: "외부 이미지 주소", style: .default, handler: nil))
        alertVC.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
}

extension NoteViewController: UITextViewDelegate, JSTextViewDelegate {
    func textViewDetectedBackSpace(_ textView: UITextView) {
        if textView.text.count == 1 {
            textView.text = "내용을 입력하세요."
            textView.textColor = .lightGray
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if textView.text == "내용을 입력하세요." && text != "" {
            textView.text = ""
            textView.textColor = .black
        }
        return true
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = "내용을 입력하세요."
            textView.textColor = .lightGray
        }
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        if textView.text == "내용을 입력하세요." {
            textView.selectedRange = NSMakeRange(0, 0)
        }
    }
    
}

extension NoteViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
    }
}

extension NoteViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "noteImageCell", for: indexPath) as? NoteImageCell {
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
    }
    
}
