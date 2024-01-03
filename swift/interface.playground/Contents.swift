import UIKit

import SwiftUI

struct ChatGPTTextField: View {

  // MARK: - State

  /// State to hold our `TextField` query.
  @State private var queryMessage: String = ""

  /// Focus state for our `TextField`.
  @FocusState private var isQueryTextFieldInFocus
  /// Reciprocal state for animating focus changes.
  @State private var isQueryTextFieldInFocusState: Bool = true
  // MARK: - Animations

  /// The spring animation to apply to various elements
  /// when the focus on our query field changes.
  let textFieldShowHideAnimation: Animation = .interpolatingSpring(stiffness: 300, damping: 24)

  // MARK: - Body

  var body: some View {
    VStack {
      Spacer()

      ZStack(alignment: .leading) {
        /// We're stacking our `plusButton` and `queryActionButtons`
        /// with a `ZStack` and animating various properties like their offsets, opacity, etc.
        plusButton
        queryActionButtons

        /// We're putting these into an `HStack` so we can
        /// use a ternary with our `isQueryTextFieldInFocusState`
        /// state object to animate their leading `.padding`. This is
        /// how we easily (and smoothly) move the `TextField` around.
        HStack(spacing: 16) {
          queryInput
          sendButton
        }
        .padding(.leading, isQueryTextFieldInFocusState ? 42 : 126)
      }
      .padding(.horizontal)
      .padding(.bottom, 12)
    }
    .onAppear {
      /// When our view appears, set `isQueryTextFieldInFocusState` to
      /// `TRUE` to match ChatGPT.
      isQueryTextFieldInFocusState = false
    }
  }

  // MARK: - Subviews

  /// Our plus button.
  private var plusButton: some View {
    Button {
      withAnimation(textFieldShowHideAnimation) {
        isQueryTextFieldInFocusState = false
      }
    } label: {
      Image(systemName: "plus")
        .font(.system(size: 15, design: .rounded).weight(.semibold))
    }
    .frame(width: isQueryTextFieldInFocusState ? 28 : 84, height: 28)
    .foregroundStyle(.secondary)
    .background(.thinMaterial)
    .clipShape(RoundedRectangle(cornerRadius: 100, style: .continuous))
    .offset(x: isQueryTextFieldInFocusState ? 0 : 84)
    .opacity(isQueryTextFieldInFocusState ? 1 : 0)
  }

  /// Our 3 action buttons:
  /// `takePhotoButton`,
  /// `uploadPhotoButton`,
  /// `uploadFileButton`.
  private var queryActionButtons: some View {
    HStack(spacing: 16) {
      takePhotoButton
      uploadPhotoButton
      uploadFileButton
    }
    .frame(width: 110)
  }

  private var takePhotoButton: some View {
    Image(systemName: "camera.fill")
      .font(.system(size: 21, design: .rounded).weight(.semibold))
      .frame(width: 26, height: 26)
      .foregroundColor(.accentColor)
      .opacity(isQueryTextFieldInFocusState ? 0 : 1)
      .scaleEffect(isQueryTextFieldInFocusState ? 0.6 : 1)
      .animation(textFieldShowHideAnimation.delay(0.12), value: isQueryTextFieldInFocusState)
  }

  private var uploadPhotoButton: some View {
    Image(systemName: "photo")
      .font(.system(size: 21, design: .rounded).weight(.semibold))
      .frame(width: 26, height: 26)
      .foregroundColor(.accentColor)
      .opacity(isQueryTextFieldInFocusState ? 0 : 1)
      .offset(x: isQueryTextFieldInFocusState ? -42 : 0)
      .scaleEffect(isQueryTextFieldInFocusState ? 0.6 : 1)
      .animation(textFieldShowHideAnimation.delay(0.06), value: isQueryTextFieldInFocusState)
  }

  private var uploadFileButton: some View {
    Image(systemName: "folder.fill")
      .font(.system(size: 21, design: .rounded).weight(.semibold))
      .frame(width: 26, height: 26)
      .foregroundColor(.accentColor)
      .opacity(isQueryTextFieldInFocusState ? 0 : 1)
      .offset(x: isQueryTextFieldInFocusState ? -84 : 0)
      .scaleEffect(isQueryTextFieldInFocusState ? 0.6 : 1)
      .animation(textFieldShowHideAnimation.delay(0), value: isQueryTextFieldInFocusState)
  }

  /// Our query input
  /// NOTE: It doesn't actually handle things like multi-line, because
  /// that's not what I was interested in building out.
  private var queryInput: some View {
    TextField(
      "Message",
      text: $queryMessage,
      onEditingChanged: { focusChange in
        /// This is the magic part.
        /// Basing animation `value` from `@FocusState` results
        /// in pretty choppy and unpredictable animations.
        /// Instead, we're going to use `onEditingChanged` to set
        /// a `@State` variable we'll use for the animations.
        withAnimation(textFieldShowHideAnimation){
          isQueryTextFieldInFocusState = true
        }
      }
    )
    /// Here we're watching our `TextField` for
    /// any changes (ie the user has the 3 buttons exposed, and
    /// types on their keyboard) - We'll close out the 3 buttons
    /// and give the input the maximum space we can.
    .onChange(of: queryMessage) { value in
      withAnimation(textFieldShowHideAnimation){
        isQueryTextFieldInFocusState = true
      }
    }
    .focused($isQueryTextFieldInFocus)
    .font(.system(size: 19, design: .rounded))
    .frame(height: 36)
    .padding(.horizontal, 12)
    .overlay {
      RoundedRectangle(cornerRadius: 12, style: .continuous)
        .strokeBorder(Color(UIColor.tertiarySystemFill), lineWidth: 1)
    }
    .overlay(alignment: .trailing) {
      Image(systemName: "waveform")
        .font(.system(size: 17, design: .rounded).weight(.semibold))
        .foregroundStyle(.secondary)
        .padding(.trailing, 12)
    }
    .onTapGesture {
      /// If our `queryActionButtons` are visible,
      /// tap the `TextField` to hide them.
      if !isQueryTextFieldInFocusState {
        withAnimation(textFieldShowHideAnimation) {
          isQueryTextFieldInFocusState = true
        }
      }
    }
  }

  /// Our send button
  private var sendButton: some View {
    Button {} label: {
      Image(systemName: "arrow.up")
        .font(.system(size: 15, design: .rounded).weight(.semibold))
    }
    .frame(width: 28, height: 28)
    .foregroundStyle(.secondary)
    .background(.thinMaterial)
    .clipShape(Circle())
  }
}

#Preview {
    ChatGPTTextField()
}
